# frozen_string_literal: true

class GraphPresenter
  GARBAGE_COLOR = {
    bio: '#ae5904',
    paper: '#3B5998',
    plastic: '#fbe400',
    waste: '#0b0b0b'
  }.freeze

  def initialize(current_user_id)
    @current_user_id = current_user_id
  end

  def chart_globals
    LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.colors(GARBAGE_COLOR.values)
    end
  end

  def chart
    @chart ||= LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Your garbage of the last month')
      f.xAxis(categories: matrix['bio'][:month])
      f.yAxis(y_axis_config)

      matrix.each do |key, value|
        f.series(name: key, yAxis: 0, data: value[:data])
      end

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({ defaultSeriesType: 'column' })
    end
  end

  private

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
      kind_data = piles_per(kind)

      months = kind_data.keys.map do |month_number|
        month_number.strftime('%B')
      end

      hash[kind] = { data: kind_data.values, month: months }
    end
  end

  def piles_per(kind)
    Pile.where(user_id: @current_user_id)
        .where(kind: kind)
        .group("DATE_TRUNC('month', produced_at)")
        .sum(:weight)
  end
end
