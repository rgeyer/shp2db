class FormattedStdout
  attr_accessor :column_width

  def initialize(column_width = 0)
    @column_width = column_width
  end

  def put_columns(col_hash_ary)
    outval = ''
    col_hash_ary.each do |column|
      if column.include?(:ansi_codes)
        outval += "\e["
        outval += column[:ansi_codes].join(';')
        outval += "m"
        outval += "#{column[:value].ljust(@column_width)}\e[0m"
      else
        outval += "#{column[:value].ljust(@column_width)}"
      end
    end
    puts outval
  end
end