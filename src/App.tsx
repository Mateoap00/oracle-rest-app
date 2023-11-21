import { useQuery } from '@tanstack/react-query';
import { getEventsRequest } from './services/eventsService';
import EventsForm from './components/EventsForm';
import './App.css';
import EventsTable from './components/EventsTable';

function App() {
    const eventsReqQuery = useQuery({
        queryKey: ['eventsRequest'],
        queryFn: getEventsRequest,
        refetchOnWindowFocus: false,
    });

    console.log(JSON.parse(JSON.stringify(eventsReqQuery)));

    if (eventsReqQuery.isError) {
        const msg = `Anecdotes service is not available due to problems in the server.`;
        return <div>{msg}</div>;
    } else if (eventsReqQuery.isPending) {
        const msg = `Loading anecdotes...`;
        return <div>{msg}</div>;
    }

    const eventsReq = eventsReqQuery.data;
    console.log(eventsReq);

    return (
        <>
            <EventsForm />
            <EventsTable eventsReq={eventsReq} />
        </>
    );
}

export default App;
