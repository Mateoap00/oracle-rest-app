import { useQuery } from '@tanstack/react-query';
import { getEventsRequest } from './services/eventsService';
import { getCustomers } from './services/customersService';
import { getFacilities } from './services/facilitiesService';
import EventsForm from './components/EventsForm';
import { ActionButtons } from './components/ActionButtons';
import EventsTable from './components/EventsTable';

function App() {
    const eventsReqQuery = useQuery({
        queryKey: ['eventsRequest'],
        queryFn: getEventsRequest,
        refetchOnWindowFocus: false,
    });

    const customersQuery = useQuery({
        queryKey: ['customers'],
        queryFn: getCustomers,
        refetchOnWindowFocus: false,
    });

    const facilitiesQuery = useQuery({
        queryKey: ['facilities'],
        queryFn: getFacilities,
        refetchOnWindowFocus: false,
    });

    // console.log(JSON.parse(JSON.stringify(eventsReqQuery)));
    // console.log(JSON.parse(JSON.stringify(customersQuery)));

    if (
        eventsReqQuery.isError ||
        customersQuery.isError ||
        facilitiesQuery.isError
    ) {
        const msg = `Services are not available due to problems in the server.`;
        return <div>{msg}</div>;
    } else if (
        eventsReqQuery.isPending ||
        customersQuery.isPending ||
        facilitiesQuery.isPending
    ) {
        const msg = `Loading data...`;
        return <div>{msg}</div>;
    }

    const eventsReq = eventsReqQuery.data;
    const customers = customersQuery.data;
    const facilities = facilitiesQuery.data;
    console.log(eventsReq);
    console.log(customers);
    console.log(facilities);

    return (
        <>
            <EventsForm customers={customers} facilities={facilities} />
            <ActionButtons />
            <EventsTable eventsReq={eventsReq} />
        </>
    );
}

export default App;
