describe 'Create profile', :create_profile do
    before(:each) do
        URL = "https://wavezapp-homolog.appspot.com/_mocked_login"
        xpathEmail = '//*[@id="main"]/section/div/p[1]/label/input'
        user = 'User-'+ (Time.now.utc.strftime("%Y%m%d%H%M%S")).to_s

        visit URL
        find(:xpath, xpathEmail).set(user)
        click_button('Login')
        sleep 5
    end

    it 'Fill the forms' do
        fillInName('Bruno Rodrigo') #New
        selectArea()
        selectRole()
        clickNext()
        sleep 5
    end

    def fillInName(name)
        find('input[placeholder="Escreva aqui seu nome completo"]').set(name) # New
    end

    def selectArea
        xpathArea = '//*[@id="main"]/section/div/div/div/div[3]/div[3]/div/select'
        find(:xpath, xpathArea).click
        find("option[value='/areas/5760293099536384']").click
    end

    def selectRole
        xpathRole = '//*[@id="main"]/section/div/div/div/div[3]/div[4]/div/select'
        find(:xpath, xpathRole).click
        find("option[value='/roles/5735735550279680']").click
    end

    def clickNext
        sleep 5
        find('button[class="ant-btn btn-start-myway-newuser"]').click
    end
end

