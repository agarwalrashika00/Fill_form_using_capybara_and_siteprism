require_relative '../pages/form_page.rb'

Given(/I am on site/) do
    @form_page = FormPage.new
    @form_page.load
end

Then(/fill the form/) do
    @form_page.fill_form_with(
        firstname: 'Rashika',
        lastname: 'Agarwal',
        email: 'agarwalrashika00@gmail.com',
        gender: 'Female',
        phone_number: 9819479280,
        dob: "12 Dec 2000",
        subjects: "History, Maths, Computer",
        hobbies: "Sports, Music",
        address: '118/202, B, Kaushalpuri, Kanpur',
        city: 'Agra',
        state: 'Uttar Pradesh'
    )
    sleep 5
end