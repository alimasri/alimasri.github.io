FROM debian

RUN apt update && apt upgrade -y
RUN apt install ruby-full build-essential git -y

RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
RUN echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc

RUN gem install jekyll -v 3.8
RUN gem install bundler jekyll-paginate jekyll-sitemap

WORKDIR /srv/jekyll
COPY . .

RUN jekyll build
EXPOSE 4000

# CMD ["jekyll", "serve", "-H", "localhost"]

CMD ["bundle", "exec", "jekyll", "serve", "--livereload", "--host", "0.0.0.0"]