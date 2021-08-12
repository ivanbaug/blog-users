# blog-users
This project is part of a python programming course from The App Brewery.

It's a blog with basic functionality using the flask framework implementing SQLite as DB, flask-login for login management and other flask extensions.

It allows an admin user to upload and edit posts, other users can register, login and comment on the blog posts.

Probably the only thing to take into account in the first run is  to delete the db to create a new one (so that it frees the admin user) by uncommenting the `db.create_all()` line in `main.py` and comment it back again in future runs.