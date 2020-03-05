#### Test task. Stage two: Rails.

#### How to use:

To install you will need a library manager, object-relational database system PostgreSQL. Run following commands:

  + clone the program from the repository:

    `git clone https://github.com/occmium/blog.git`

  + go to the program folder:

    `cd blog`

  + to install Bundler:

    `gem install bundler`

  + install all of the required gems:

    `bundle install`

  + to set permissions, type 

    `EDITOR=nano rails credentials:edit`

    You can get configuration data and instructions from https://github.com/occmium

  + start the server:

    `bundle exec rails s`

  + go to

    [localhost:3000](http://localhost:3000/)

program|version
:---:|:---:
Ruby|2.7.0
Rails|6.0.2.1
PostgreSQL12|2.3.3
