# Craigslist Jr

## Learning Competencies

* Build a wireframe
* Deepen your ActiveRecord skills around associations.
* Implement all four parts of [CRUD][]: create, read, update, and delete.
* Follow the flow through an MVC web application

## Summary

We're going to build a simple version of Craigslist.  This will be your first
web application that uses multiple models.

Keep in mind that this is not substantially different than a command-line
version.  Instead of reading in command-line arguments, we read in URL
parameters.  Instead of printing to the console, we print HTML and CSS.

We'll only have two models in a one-to-many relationship; no different than
your command-line TODO app.

There is a skeleton available in `/source`, as per usual

## Releases

### Release 0: Wireframe With Your Pair

Never heard of a web wireframe? Check out [what Wikipedia has to
say](http://en.wikipedia.org/wiki/Website_wireframe). **TL;DR** -- figure out
what *pages* your app needs, then sketch-out the basic *layout* of each and the
*connections* between them.

The application will have two core models: `Post` and `Category`.  A `Post`
belongs to a `Category` and a `Category` has many `Posts`.

A `Category` is something like "Apartment Rentals" or "Auto Parts."

Sit down and work out with your pair what pages you're going to be building.
At a minimum, you'll need:

1. A page that lists all the categories
2. A page that lists all the postings in a given category
3. A page that lets someone create a new posting in a given category
4. A page that lets someone who has created a page return to edit/update the page

If you're never used Craigslist, it doesn't have any kind of user
authentication.  Instead, when someone creates a post they're given a special
"secret" URL that grants them powers to edit that post that looks like

```text
http://craigslist.com/post/123/edit?key=kjansd812
```

The key is randomly generated.  The person is given their "edit URL" after they
successfully create a post.  Anyone with this URL can edit the post.

Think about this like a real web application you might want someone to use.
What fields should a `Post` have?

A price, probably.  What should the column type of a money-related column be?

An email, so the poster could be contacted.  Title, description, etc.

Spend time enumerating the pages, deciding what should be displayed on each
one.

### Release 1: Implement Controller Structure

Our controller structure will be more complicated.  We'll want URLs that look
like `/categories/123` and `/posts/456`.  We'll be using both `get` and `post`
methods.

To create a new `Post`, for example, we'd want to submit an HTML form using the
POST http method to the `/posts` URL, like so:

```html
<form action="/posts" method="post">
  <!-- other form elements here -->
</form>
```

and to update an existing record (say with id `1234`) we'd want to post to
`/posts/1234`.

Controllers should either redirect to another URL or render a page.  Typically,
a page loaded via HTTP POST will redirect to an appropriate URL if a request
succeeds and render an error page, otherwise.

### Ship it!

Make sure the core features work.  We should be able to download your app, run
it, and do the following:

1. Choose a category to browse
2. View all postings in a particular category
3. View a particular posting
4. Create my own posting
5. Edit my postings by using the "secret key" that I get after creating my posting

When we say "download your app" we mean "check it out from source, run the
migrations, and start up the server."  Imagine you're showing this great idea
off to your boss or a colleage who will help you if they can get it up and
running.  How might you make sure that *they* are effective with only a basic
knowledge of the DBCstarter kit?  A good developer makes it easy to get up and
running because not wasting others' time is a virtue.

### Release 3: Add One Final Feature

One last feature to add: the "this is awesome" feature.  What does awesome
mean?  It can mean anything.  The code is awesome, there are new awesome
features, the design is awesome.

We'll be picking one pair at random tomorrow morning to show off their version
of Craigslist.  They'll get a full-on UX and code review.

This isn't a race; there's no finish line, only a deadline (tomorrow, duh!).
Take the time to make this application something you're proud of.  It doesn't
have to be flashy &mdash; it could be a difficult technical hurdle you
overcame.

## Resources

[CRUD]: http://en.wikipedia.org/wiki/Create,_read,_update_and_delete
