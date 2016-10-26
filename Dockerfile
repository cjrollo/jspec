FROM jruby
MAINTAINER rollo
RUN mkdir jruby && cd $_
RUN gem install rails --no-document
RUN rails new jxls_rails -T
WORKDIR jxls_rails/
RUN rails g scaffold Invoice invoice_number:string invoice_date:string customer:string total_value:decimal
RUN rake db:migrate
EXPOSE 3000
CMD rails s
