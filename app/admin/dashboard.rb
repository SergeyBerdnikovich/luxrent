# class Exits
#   extend Garb::Model
#   metrics :exits, :pageviews, :exit_rate, :new_visits
#   dimensions :page_path, :country
# end
    class Pageviews
        extend Garb::Resource
        metrics :pageviews
    end
# coding: utf-8
ActiveAdmin.register_page "Dashboard" do
  menu :priority => 0, :label => 'Статистика'

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        div "Более подробную статистику можно посмотреть #{link_to 'здесь', 'http://www.google.com/analytics/', :target => '_blank'}".html_safe
      end
      br
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
        Garb::Session.login('Luxauto000@gmail.com', '1234035aab')
        profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == 'UA-42624075-1'}

      column do
        #@result = profile.exits.to_a
        report = Garb::Report.new(profile, {:start_date => Date.today-30, :end_date => Date.today})
        report.metrics :pageviews, :new_visits, :unique_pageviews
        report.dimensions :country
        report.sort :country
        report2 = Garb::Report.new(profile, {:start_date => Date.today-30, :end_date => Date.today})
        report2.metrics :pageviews, :new_visits, :unique_pageviews
        report3 = Garb::Report.new(profile, {:start_date => Date.today-30, :end_date => Date.today})
        report3.metrics :pageviews, :new_visits, :unique_pageviews
        report3.dimensions :device_category

        report.filters do
          matches(:page_path, '/')
        end
        report2.filters do
          matches(:page_path, '/')
        end
        report3.filters do
          matches(:page_path, '/')
        end

        panel "Посещения" do
          para "Посещения http://luxauto.by"
          report2.results.each do |page|
              div "Посещений: #{page.pageviews}, новых посещений: #{page.new_visits}"
              div "Уникальных посещений: #{page.unique_pageviews}"
          end
        end
        panel "По странам" do
          report.results.each do |page|
            div do
                strong page.country
                div "Посещений: #{page.pageviews}, уникальных: #{page.unique_pageviews}, новых: #{page.new_visits}"
            end
          end
        end
        panel "Категории устройств" do
          report3.results.group_by(&:device_category).each do |category, pages|
            strong category
            pages.each do |page|
                div "Посещений: #{page.pageviews}, уникальных: #{page.unique_pageviews}, новых: #{page.new_visits}"
            end
          end
        end
      end

      column do
        #@result = profile.exits.to_a
        report = Garb::Report.new(profile, {:start_date => Date.today-30, :end_date => Date.today})
        report.metrics :pageviews, :new_visits, :unique_pageviews
        report.dimensions :browser, :country
        report.sort :browser

        report.filters do
          matches(:page_path, '/')
        end

        panel "По браузерам" do
          report.results.group_by(&:country).each do |country, pages|
            div do
                strong country
                pages.each do |page|
                    div "Браузер: #{page.browser}, посещений: #{page.pageviews}, уникальных: #{page.unique_pageviews}, новых: #{page.new_visits}"
                end
            end
          end
        end
        panel "Внимание" do
            div do
                strong "Все данные показываются за период с #{Date.today-30} по #{Date.today}"
            end
        end
      end

      column do
        #@result = profile.exits.to_a
        report = Garb::Report.new(profile, {:start_date => Date.today-30, :end_date => Date.today})
        report.metrics :pageviews, :new_visits, :unique_pageviews
        report.dimensions :operating_system, :country
        report.sort :operating_system

        report.filters do
          matches(:page_path, '/')
        end

        panel "По операционным системам" do
          report.results.group_by(&:country).each do |country, pages|
            div do
                strong country
                pages.each do |page|
                    div "OC: #{page.operating_system}, посещений: #{page.pageviews}, уникальных: #{page.unique_pageviews}, новых: #{page.new_visits}"
                end
            end
          end
        end
      end

    end
    columns do
        Garb::Session.login('Luxauto000@gmail.com', '1234035aab')
        profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == 'UA-42624075-1'}

      column do
        #@result = profile.exits.to_a
        report = Garb::Report.new(profile, {:start_date => Date.today-30, :end_date => Date.today})
        report.metrics :pageviews, :new_visits, :unique_pageviews
        report.dimensions :full_referrer, :country
        report.sort :full_referrer

        report.filters do
          matches(:page_path, '/')
        end

        panel "Откуда пришли нa сайт" do
          report.results.group_by(&:country).each do |country, pages|
            div do
                strong country
                pages.each do |page|
                    div "Пришли с: #{page.full_referrer}, посещений: #{page.pageviews}, уникальных: #{page.unique_pageviews}, новых: #{page.new_visits}"
                end
            end
          end
        end
      end
    end
  end # content
end

