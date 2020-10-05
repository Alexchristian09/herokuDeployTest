require 'rails_helper'

feature 'Add books' do

    scenario 'Add new book and verify' do
        visit new_book_path
        fill_in 'book_title', with: 'Harry Potter'
        fill_in 'book_author', with: 'J.K. Rowling'
        select 'Fantasy', from: 'book_genre'
        fill_in 'book_price', with: '9.99'
        select 'June', from: 'book_publisheddate_2i'
        select '26', from: 'book_publisheddate_3i'
        select '1997', from: 'book_publisheddate_1i'
        click_on 'Create Book'
        expect(page).to have_content('Harry Potter')
        expect(page).to have_content('J.K. Rowling')
        expect(page).to have_content('Fantasy')
        expect(page).to have_content('9.99')
        expect(page).to have_content('1997-06-26')
    end

    scenario 'Add book with blank inputs and it does not work' do
        visit new_book_path
        click_on 'Create Book'
        expect(page).to have_content('cannot be blank')
    end

end

feature 'Delete book' do

    scenario 'Add new book and delete' do
        visit new_book_path
        fill_in 'book_title', with: 'Harry Potter'
        fill_in 'book_author', with: 'J.K. Rowling'
        select 'Fantasy', from: 'book_genre'
        fill_in 'book_price', with: '9.99'
        select 'June', from: 'book_publisheddate_2i'
        select '26', from: 'book_publisheddate_3i'
        select '1997', from: 'book_publisheddate_1i'
        click_on 'Create Book'
        expect(page).to have_content('Harry Potter')
        expect(page).to have_content('J.K. Rowling')
        expect(page).to have_content('Fantasy')
        expect(page).to have_content('9.99')
        expect(page).to have_content('1997-06-26')
        click_on 'Delete'
        expect(page).to have_content('Are you sure you want to permanently delete this book')
        expect(page).to have_content('Harry Potter')
        click_on 'Delete'
        expect(page).to have_content('Book \'Harry Potter\' destroyed successfully.')
        expect(page).to have_no_content('J.K. Rowling')
    end

end

feature 'Add and view book' do

    scenario 'Add new book and delete' do
        visit new_book_path
        fill_in 'book_title', with: 'Harry Potter'
        fill_in 'book_author', with: 'J.K. Rowling'
        select 'Fantasy', from: 'book_genre'
        fill_in 'book_price', with: '9.99'
        select 'June', from: 'book_publisheddate_2i'
        select '26', from: 'book_publisheddate_3i'
        select '1997', from: 'book_publisheddate_1i'
        click_on 'Create Book'
        expect(page).to have_content('Harry Potter')
        expect(page).to have_content('J.K. Rowling')
        expect(page).to have_content('Fantasy')
        expect(page).to have_content('9.99')
        expect(page).to have_content('1997-06-26')
        click_on 'Show'
        expect(page).to have_content('Show Book')
        expect(page).to have_content('Harry Potter')
        expect(page).to have_content('J.K. Rowling')
        expect(page).to have_content('Fantasy')
        expect(page).to have_content('9.99')
        expect(page).to have_content('1997-06-26')
    end

end