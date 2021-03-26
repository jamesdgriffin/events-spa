// Feed.js
import { Row, Col, Card } from 'react-bootstrap';
import { connect } from 'react-redux';

function event_path(event) {
  return event.event_hash;
}

function Event({event}) {
  return (
    <Col>
      <Card>
        <Card.Text>
          Event created by {event.user.name}<br />
          Name: {event.name}<br />
          Date: {event.date}<br />
          Desc: {event.description}<br />
        </Card.Text>
      </Card>
    </Col>
  );
}

function Feed({events}) {
  let cards = events.map((event) => <Event event={event} key={event.id} />);
  return (
    <Row>
      { cards }
    </Row>
  );
}

export default connect(({events}) => ({events}))(Feed);
