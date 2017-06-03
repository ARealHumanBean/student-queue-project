namespace :db do
    desc 'Create sample users'
    task populate: :environment do
        1.times do |n|
            User.create(
                camosun_id: 'C0123456',
                role: 1,
                first_name: 'Tak',
                last_name: 'Minohara'
            )
        end
    end
end
