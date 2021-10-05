

CREATE TABLE events (
	id UUID PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
  create_time timestamp NOT NULL DEFAULT NOW()
);

CREATE TABLE event_details (
	id UUID PRIMARY KEY,
	event_id UUID NOT NULL,
	action VARCHAR(100) NOT NULL,
  time timestamp NOT NULL,
  create_time timestamp NOT NULL DEFAULT NOW(),
  CONSTRAINT fk_events_id FOREIGN KEY(event_id) REFERENCES events
);

