
window.docomo ?= {}

class docomo.Docomo
  constructor: ($, @el = $('body')) ->
    @has_storage = typeof Storage != undefined
    @examples_only = if @has_storage and localStorage.examples_only is "true" then true else false
    @initialize()
    @addListeners()
    @toggleStylingMode() if @examples_only


  initialize: ->
    @window = $(window)
    @aside_list = @el.find '#docomo_sidebar li'
    @usages = @el.find('.docomo-showcase + pre, .docomo-showcase + .highlight > pre').addClass 'docomo-hidden docomo-usage'
    @usage_btns = @usages.before(@templUsage()).prev '.docomo-usage-toggle'


  dispose: ->
    @removeListeners()


  addListeners: ->
    @aside_list.on 'click.docomo:aside', => @toggleAside arguments...
    @usage_btns.on 'click.docomo:usage', => @toggleUsage arguments...
    @window.on 'keypress.docomo:keyed', => @keyed arguments...


  removeListeners: ->
    @aside_list.off 'click.docomo:aside'
    @usage_btns.off 'click.docomo:usage'
    @window.off 'keypress.docomo:keyed'


  keyed: (e) ->
    @toggleShortcuts() if e.keyCode is 63        # "?"
    @toggleStylingMode() if e.keyCode is 88      # "x"


  toggleAside: (e) ->
    @aside_list.removeClass 'active'
    $(e.target).closest('li').addClass 'active'


  toggleUsage: (e) ->
    e?.preventDefault()
    target = $(e.target)
    usage = @usages.eq(@usage_btns.index target).toggleClass 'docomo-hidden'
    return target.html(target.html().replace /^Hide/, 'View') if usage.hasClass 'docomo-hidden'
    return target.html(target.html().replace /^View/, 'Hide')


  toggleStylingMode: ->
    not_styles = '.docomo-showcase, .docomo-usage, .docomo-usage-toggle, h1'
    @non_styles ?= @el.find('.docomo-section').children().not not_styles
    @non_styles.toggleClass 'docomo-hidden'
    @examples_only = @non_styles.hasClass('docomo-hidden')
    localStorage.examples_only = @examples_only if @has_storage


  toggleShortcuts: ->
    console?.log @shortcut_output ?= @templShortcut()


# TEMPLATES #


  templUsage: ->
    '<a class="docomo-usage-toggle" href="#">View Markup</a>'


  templShortcut: ->
    """
    <SHIFT> + ? \tPrint this message
    <SHIFT> + x \tToggle showing only h1, showcase and usage blocks
    """

