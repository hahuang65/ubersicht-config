command: "echo $(~/.dotfiles/ubersicht/scripts/current-date)"

refreshFrequency: 30000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/styles.css" />
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/colors.css" />
    <div id="content"></div>
  """

style: """
  right: 105px
  top: 4px
  """

content: (output) ->
  """
    <span class="white"><i class="icon fa fa-calendar red" aria-hidden="true"></i>#{output}</span>
  """

update: (output, domEl) ->
  $(domEl).find('#content').html(@content(output))
