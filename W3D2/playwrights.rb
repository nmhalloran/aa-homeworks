require 'sqlite3'
require 'singleton'
require 'pry'
require 'byebug'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright

  attr_accessor :name, :birth_year, :id, :plays

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def initialize(options)
    byebug
    @id = options[:id]
    @name = options[:name]
    @birth_year = options[:birth_year]
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} does not exist" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE id = ?
    SQL
  end

  def self.find_by_playwright(name)
    Playwright.all.select { |playwright| playwright.name == name }[0]
  end

  def self.get_plays(name)
    artiste = Playwright.find_by_playwright(name)
    return nil unless artiste
    Play.all.select { |play| play.playwright_id == artiste.id }
  end

end
