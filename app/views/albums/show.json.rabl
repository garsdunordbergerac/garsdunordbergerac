object false

node(:event_id) { @event.id }
node(:photos)   { @album_entries.map { |entry| entry.content.src }}
