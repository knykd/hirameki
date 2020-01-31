# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Rails.root使用
require File.expand_path(File.dirname(__FILE__) + '/environment')
# ジョブ実行環境指定
set :environment, :production
# cronのログの場所
set :output, "#{Rails.root}/log/cron.log"

# 一週間おきに実行する
every 1.week do
  rake 'scrape:get_words'
end
