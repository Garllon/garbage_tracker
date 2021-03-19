# frozen_string_literal: true

class GraphsController < ApplicationController
  def index
    chart

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.colors(['#ae5904', '#3B5998', '#fbe400', '#0b0b0b'])
    end
  end

  private

  def chart
    @chart ||= LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Your garbage of the last month')
      f.xAxis(categories: matrix['bio'][:month])
      matrix.each do |key, value|
        f.series(name: key, yAxis: 0, data: value[:data])
      end

      f.yAxis(y_axis_config)
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({ defaultSeriesType: 'column' })
    end
  end

  def y_axis_config
    { title: { text: 'Garbage in Gramm', margin: 70 },
      # TODO: Plotlines is maybe not the best here. Needs optimisation
      plotLines: [{
        color: 'yellow',
        width: 2,
        value: 9500,
        zIndex: 5
      }] }
  end

  def matrix
    @matrix ||= Pile.kinds.keys.each_with_object({}) do |kind, hash|
      kind_data = Pile.where(user_id: current_user.id)
                      .where(kind: kind)
                      .group("DATE_TRUNC('month', produced_at)")
                      .sum(:weight)

      months = kind_data.keys.map do |month_number|
        month_number.strftime('%B')
      end

      hash[kind] = { data: kind_data.values,
                     month: months }
    end
  end
end
