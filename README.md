# Docomo

[![Build Status](https://secure.travis-ci.org/modeset/docomo.png)](http://travis-ci.org/modeset/docomo)
[![Dependency Status](https://gemnasium.com/modeset/docomo.png)](https://gemnasium.com/modeset/docomo)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/modeset/docomo)

Docomo generates static documentation for rails assets using Markdown and pygments.

Documentation is hard, so Docomo provides an easy and elegant way to provide markdown documentation files for all your
assets, including Sass, and CoffeeScript.  Technically speaking though, it doesn't have to be used strictly for assets.

The way Docomo works is great for asset documentation, but at it's core it simply collects markdown files and puts
them into an easily filterable, and navigable documentation collection.

To achieve clean documentation for assets you can include a `.md` file for Docomo to parse.  These files are parsed and
rendered into dynamic documentation that you can provide complex notation and example usage with.  Usage examples are a
great way to do regression testing on various platforms as well, so it's not just about documentation.


## Installation

Include the gem in your Gemfile and bundle to install the gem.  (requires Ruby 1.9+)

    gem 'docomo'

You can also get the initializer (and optionally the template and css/javascript files) by running the install
generator.

    rails generate docomo:install

## Usage

You can run the rake task to have the files written out (by default to `public/docomo`)

    rake docomo:generate

Or you can browse to the live (dynamically changing when you're working on things) on your development server:

    localhost:3000/docomo/live

## Creating Documentation

Create .md files (file matchers are configurable), and provide live examples and documentation for your library.

Docomo extends markdown just a little bit and provides some nice things for rendering external files in place into your
markdown documentation.  To include an external file into your documentation:

    [<Example File](markup/button_semigloss.html.haml)

This file will be parsed and injected directly into your documentation (haml is rendered into html).

The tilde is added for live examples.  By using `~` in various places you can get both the example rendered as html,
and a code example that can be viewed and copied.  Here's two ways to use it.

    [<~Example File](markup/button_semigloss.html.haml)

In this example an external file is parsed and injected in line, and a live example of that content is rendered in
place, followed by the exact code that was used in the example.

    ```~haml
    %h1 Title
    ```

Using the above techniques we're able to provide live examples that include the original code views -- if the're html
or haml.

The html output for the second example would look like:

    <div class="docomo-showcase">
      <h1>Title</h1>
    </div>
    <pre>
      <code class="haml">
        %h1 Title
      </code>
    </pre>


## Examples

    # Button Semigloss
    A semi-glossy button created via various mixins. By default, no classes are added to the style sheet unless told to do so.

    ```sass
    @import utensils/button_semigloss/button_semigloss
    ```

    ## Usage Example
    <!--~ markup/button_semigloss.html.haml -->

    The semigloss-button class can be applied to `<a>`, `<button>` and `<input>` elements.

    ```~haml
    %section.semigloss-btn-demo
      %a.btn(href="#") Link
      %button.btn(type="submit") Button
      %input.btn(type="button" value="Input")
      %input.btn(type="submit" value="Submit")
    ```

    ## Options
    Semigloss button contains 3 mixins.

    ### Mixin: `semigloss-button`

    Generates the base class for modifiers to extend.

    Parameter          | Default          | Description
    ------------------ | ---------------- | -------------------------------------------
    `$bg`              | _none_           | This is a required parameter
    `$color`           | `#fff`           | The text `color`
    `$hover-percent`   | `10%`            | The percentage to darken the `background-color` on hover
    `$active-percent`  | `15%`            | The percentage to darken the `background-color` on press and `.active`
    `$border-percent`  | `30%`            | The percentage to darken the `border-color` against `$bg`
    `$padding`         | `$base-padding`  | The `padding` within the button
    `$radii`           | `$radii`         | The button's `border-radius`

    ```sass
    .btn
      +semigloss-button($body-bgc, $link-color)
    ```


## Todo

### Styles and Markup
- get default styles and javascript finished (with mobile support)

### Parser
- add "inclusions" state that collects stylesheets, javascript, and additional javascript to run on page load
- include page level navigation so instead of generating a large file, individual pages can be created
- read contents from code files (this is probably another tool similar to fixtures)


## License

Licensed under the [MIT License](http://opensource.org/licenses/mit-license.php)

Copyright 2012 [Mode Set](https://github.com/modeset)


## Make Code Not War
