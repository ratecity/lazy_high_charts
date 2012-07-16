module LazyHighCharts
  class InstallGenerator < Rails::Generators::Base
    desc "Install highcharts and highstock javascripts from latest stable"
    def install_highcharts(opts = nil)
      say_status("installing", "Highcharts and Highstock javascripts (latest stable)", :green)
      if ::Rails::VERSION::MAJOR == 3 && ::Rails::VERSION::MINOR >= 1
        get 'http://code.highcharts.com/stock/highstock.js', 'vendor/assets/javascripts/highstock.js'
        get 'http://code.highcharts.com/highcharts.js', 'vendor/assets/javascripts/highcharts.js'
      else
        get "https://raw.github.com/highslide-software/highcharts.com/stock/js/highcharts.src.js","public/javascripts/highcharts.js"
      end
    rescue OpenURI::HTTPError
      say_status("warning", "could not find Highcharts javascript file", :yellow)
    end
  end
end
