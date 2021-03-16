class GraphsController < ApplicationController
  def index
    @matrix = Pile.kinds.keys.each_with_object({}) do |kind, hash|
      kind_data = Pile.where(user_id: current_user.id)
                      .where(kind: kind)
                      .group("DATE_TRUNC('month', produced_at)")
                      .sum(:weight)

      hash[kind] = { data: kind_data.values,
                     month: kind_data.keys.map(&:month) }
    end

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Your garbage of the last month')
      f.xAxis(categories: @matrix['bio'][:month])
      @matrix.each do |key, value|
        f.series(name: key, yAxis: 0, data: value[:data])
      end

      f.yAxis [
        {title: {text: "Garbage in Gramm", margin: 70} },
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "column"})
    end

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.colors(["#ae5904", "#3B5998", "#fbe400", "#0b0b0b"])
    end
  end
end
