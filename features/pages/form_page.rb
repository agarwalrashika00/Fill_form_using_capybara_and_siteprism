class FormPage < SitePrism::Page
    set_url "https://demoqa.com/automation-practice-form"
    set_url_matcher(/demoqa.com/)

    element :firstname, '[id = "firstName"]'
    element :lastname, '[id = "lastName"]'
    element :email, '[id = "userEmail"]'
    element :male, '[for = "gender-radio-1"]'
    element :female, '[for = "gender-radio-2"]'
    element :other, '[for = "gender-radio-3"]'
    element :phone_number, '[id = "userNumber"]'
    element :dob, '[id = "dateOfBirthInput"]'
    element :subjects, '[id="subjectsInput"]'
    element :sports, '[for = "hobbies-checkbox-1"]'
    element :reading, '[for = "hobbies-checkbox-2"]'
    element :music, '[for = "hobbies-checkbox-3"]'
    element :address, '[id="currentAddress"]'
    element :state, '[id="react-select-3-input"]'
    element :city, '[id = "react-select-4-input"]'
    element :submit_button, '[id = "submit"]'

    def fill_form_with(**form_info)
        firstname.set form_info[:firstname]
        lastname.set form_info[:lastname]
        email.set form_info[:email]
        case form_info[:gender]
        when 'Male'
            male.click
        when 'Female'
            female.click
        else
            other.click
        end
        phone_number.set form_info[:phone_number]
        dob.set form_info[:dob]
        dob.send_keys :enter
        form_info[:subjects].split(', ').each do |subject|
            subjects.send_keys subject
            subjects.send_keys :enter
        end
        form_info[:hobbies].split(', ').each do |hobby|
            case hobby
            when "Sports"
                sports.click
            when "Reading"
                reading.click
            when "Music"
                music.click
            end
        end
        address.set form_info[:address]
        state.set form_info[:state]
        state.send_keys :enter
        city.set form_info[:city]
        city.send_keys :enter

        submit_button.click
        sleep 3
        page.save_screenshot 'C:\Users\Rashika\Desktop\capybara and siteprism\output.png'
    end
end