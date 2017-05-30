jQuery(function() {
  return $('#team_info_topic_name').autocomplete({
    source: $('#team_info_topic_name').data('autocomplete-source')
  });
});