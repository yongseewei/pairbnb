web: bundle exec rails server -p $PORT
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
worker: bundle exec sidekiq -e production -q default -q mailers
worker: elasticsearch