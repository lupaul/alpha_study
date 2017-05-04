class Admin::SchoolsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  def index
    redirect_to action: :report
  end

  def account_activity
    @school = User.find(current_user)
  end

  def consultations
    @consultations = current_user.school.consultations
  end

  def report

    @inversemsarea =  Fusioncharts::Chart.new({
        :height => 300,
        :width => 400,
        :type => 'mscombi2d',
        :renderAt => 'inverse-container',
        :dataSource => {
          :chart => {
              :caption => 'PageView ',
              :subCaption => '頁面參觀數',
              :xAxisname => 'Day',
              :yAxisName => '瀏覽人數',
              :theme => 'fint'
          },
          categories: [{
            category: [
              { label: "Mon"},
              { label: "Tue"},
              { label: "Wed"},
              { label: "Thu"},
              { label: "Fri"},
              { label: "Sat"},
              { label: "Sun"}
            ]
          }],
          dataset: [{
            seriesname: "This Week 本週",
            renderas: "line",
            showvalues: "1",
            data: [
              { value: "500"},
              { value: "320"},
              { value: "390"},
              { value: "370"},
              { value: "480"},
              { value: "410"},
              { value: "450"}
            ]
            },{
            seriesname: "Last Week 上週",
            renderas: "area",
            showvalues: "1",
            data: [
              { value: "220"},
              { value: "130"},
              { value: "250"},
              { value: "290"},
              { value: "190"},
              { value: "210"},
              { value: "260"}
            ]

          }
          ]
        }
    })

    @multicolumn = Fusioncharts::Chart.new({
        :height => 300,
        :width => 400,
        :type => 'mscolumn2d',
        :renderAt => 'multi-container',
        :dataSource => {
            :chart => {
                caption:  "Traffic Estimation",
                :subCaption => '流量評估',
                :xAxisname => '時間',
                :yAxisName => '流量',
                theme: 'fint'
            },
            :categories => [{
                :category => [
                  { label: "Quarter 季"},
                  { label: "Month 月"},
                  { label: "Week 周"},
                  { label: "Day 天"},

                ]
            }],
            :dataset =>  [{
                :seriesname => '2016',
                :data =>  [
                  { value: "21000"},
                  { value: "11000"},
                  { value: "2500"},
                  { value: "450"}
                ]},{
                :seriesname => '2017',
                :data =>  [
                  { value: "19000"},
                  { value: "9000"},
                  { value: "2300"},
                  { value: "300"}
                ]}
            ]
          }
          })


    @pie = Fusioncharts::Chart.new({
        :height => 500,
        :width => 800,
        :type => 'pie3d',
        :renderAt => 'pie-container',
        :dataSource => {
                  "chart" =>  {
                        "caption": "四月名單轉換率",
                        "subCaption": "Conversion Rate",
                        "startingAngle": "120",
                        "showLabels": "0",
                        "showLegend": "1",
                        "enableMultiSlicing": "0",
                        "slicingDistance": "15",
                        # //To show the values in percentage
                        "showPercentValues": "1",
                        "showPercentInTooltip": "0",
                        "plotTooltext": "$label :  $value 人",
                        "theme": "fint"
                    },
                    "data": [{
                        "label": "活動報名",
                        "value": "25"
                    }, {
                        "label": "會員人數",
                        "value": "95"
                    }]
          }
      })
  end

  def check
    if params[:click] == "multi"
      @type = "multi"
    else
      @type = "inverse"
    end

    @multicolumn = Fusioncharts::Chart.new({
        :height => 800,
        :width => 700,
        :type => 'mscolumn2d',
        :renderAt => 'multi1-container',
        :dataSource => {
            :chart => {
                caption:  "Traffic Estimation",
                :subCaption => '流量評估',
                :xAxisname => '時間',
                :yAxisName => '流量',
                theme: 'fint'
            },
            :categories => [{
                :category => [
                  { label: "Quarter 季"},
                  { label: "Month 月"},
                  { label: "Week 周"},
                  { label: "Day 天"},

                ]
            }],
            :dataset =>  [{
                :seriesname => '2016',
                :data =>  [
                  { value: "21000"},
                  { value: "11000"},
                  { value: "2500"},
                  { value: "450"}
                ]},{
                :seriesname => '2017',
                :data =>  [
                  { value: "19000"},
                  { value: "9000"},
                  { value: "2300"},
                  { value: "300"}
                ]}
            ]
          }
          })

    @inversemsarea =  Fusioncharts::Chart.new({
        :height => 800,
        :width => 700,
        :type => 'mscombi2d',
        :renderAt => 'inverse1-container',
        :dataSource => {
          :chart => {
              :caption => 'PageView ',
              :subCaption => '頁面參觀數',
              :xAxisname => 'Day',
              :yAxisName => '瀏覽人數',
              :theme => 'fint'
          },
          categories: [{
            category: [
              { label: "Mon"},
              { label: "Tue"},
              { label: "Wed"},
              { label: "Thu"},
              { label: "Fri"},
              { label: "Sat"},
              { label: "Sun"}
            ]
          }],
          dataset: [{
            seriesname: "This Week 本週",
            renderas: "line",
            showvalues: "1",
            data: [
              { value: "500"},
              { value: "320"},
              { value: "390"},
              { value: "370"},
              { value: "480"},
              { value: "410"},
              { value: "450"}
            ]
            },{
            seriesname: "Last Week 上週",
            renderas: "area",
            showvalues: "1",
            data: [
              { value: "220"},
              { value: "130"},
              { value: "250"},
              { value: "290"},
              { value: "190"},
              { value: "210"},
              { value: "260"}
            ]

          }
          ]
        }
    })


    respond_to do |format|
      format.js
    end

  end


end
