collection @events

attributes :id, :album_title, :place, :title

node(:begin_at)    { |event| l(event.begin_at) if event.begin_at }
node(:description) { |event| simple_format(CGI.escapeHTML(event.description)) }
node(:end_at)      { |event| l(event.end_at) if event.end_at }
