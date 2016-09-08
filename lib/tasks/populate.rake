namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require "populator"
    require "faker"
# TODO 
# https://github.com/stympy/faker
# https://github.com/blackcoat77/bookorama/tree/master/bookorama/lib/tasks

    [Category, Book].each(&:delete_all)

    Category.populate 6 do |category|

      category.category_name = Faker::Book.genre
      category.visible =  Faker::Boolean.boolean

      Book.populate 32 do |book|
        book.category_id = category.id
        book.title = Faker::Book.title
        book.description = Populator.sentences(1)
      end

    end

# seed images from samplimages folder
Post.all.each { |post| post.image = File.open(Dir.glob(File.join(Rails.root, 'dummyimages', '*')).sample); post.save! }

  end
end
