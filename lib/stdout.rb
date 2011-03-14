#  Copyright 2011 Ryan J. Geyer
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

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