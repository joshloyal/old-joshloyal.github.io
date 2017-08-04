import threading
import webbrowser
import os

from http.server import HTTPServer, SimpleHTTPRequestHandler


class HTTPRequestHandler(SimpleHTTPRequestHandler):
    """Hacky way to get blog posts to resolve
    (dont have the html extenstion)"""
    def do_GET(self):
        posts = [f.split('.')[0] for f in os.listdir('blog') if
                 f.endswith('.html') and
                 f not in ['index.html' '404.html']]
        path_end = self.path.split('/')[-1]
        if path_end in posts:
            self.path = self.path + '.html'

        return super(HTTPRequestHandler, self).do_GET()

def run_server(server_class=HTTPServer, handler_class=HTTPRequestHandler):
    server_address = ('', 8000)
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()


def run_browser(browser=''):
    browser = webbrowser.get(browser if browser else None)
    browser.open('http://localhost:8000/', new=2)


def run_site():
    threading.Thread(target=run_server).start()
    threading.Thread(target=run_browser).start()


if __name__ == '__main__':
    run_site()
