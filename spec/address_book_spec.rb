require_relative '../models/address_book'

RSpec.describe AddressBook do
  describe "attributes" do
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  describe "#remove_entry" do
    it "removes only one entry from the address book" do
      #add an entry, remove it. confirm that no entries are present
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(0)
    end

    it "removes the correct entry from the address book" do
      #add two entries to the book, remove one. check that the correct entry was removed by seeing that index[0] matches second entry
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.add_entry('James Lovelace', '011.012.1815', 'james.king@lovelace.com')
      book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('James Lovelace')
      expect(new_entry.phone_number).to eq('011.012.1815')
      expect(new_entry.email).to eq('james.king@lovelace.com')

    end
  end
end
