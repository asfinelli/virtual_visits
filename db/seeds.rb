# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
#
User.create(username: "mrknox",
            password_digest: "asdf1",
            name: "Mickey Knox",
            dob: 19700304,
            email: "mickeyknox@gmail.com",
            phone_number:"305-744-5691",
            gender: "Male",
            address: "123 Apple Street",
            city: "Davie",
            state: "FL",
            postal_code: "33024",
            country: "United States");
User.create(username: "missknox",
            password_digest: "asdf1",
            name: "Mallory Knox",
            dob: 19750630,
            email: "mknox@gmail.com",
            phone_number: "305-744-5692",
            gender: "Female",
            address: "123 Apple Street",
            city: "Davie",
            state: "FL",
            postal_code: "33204",
            country: "United States",);
User.create(username: "ddarko",
            password_digest: "asdf1",
            name: "Donnie Darko",
            dob: 19910501,
            email: "ddarko@gmail.com",
            phone_number: "786-276-9451",
            gender: "Male",
            address: "456 Lemon Lane",
            city: "Davie",
            state: "FL",
            postal_code: "33204",
            country: "United States");

Doctor.create(username: "dwright",
            password_digest: "asdf1",
            name: "Deborah Wright",
            dob: 19920906,
            email: "dwright@doctors.co",
            phone_number: "786-234-2432",
            gender: "Female",
            address: "470 Doctors Drive",
            city: "Davie",
            state: "FL",
            postal_code: "33204",
            country: "United States");

Appointment.create(user_id:"#{current_user}",
                    name:  "Donnie Darko",
                    symptoms: "fever",
                    blood_pressure: "140/70",
                    temperature: "102",
                    medications: "crazy pills"
                  )
