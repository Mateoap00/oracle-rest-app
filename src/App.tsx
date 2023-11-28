import { useQuery } from '@tanstack/react-query';
import { getEventsRequest } from './services/eventsService';
import { getCustomers } from './services/customersService';
import { getFacilities } from './services/facilitiesService';
import { getAudtEventsReq } from './services/audtEventReqService';
import EventsForm from './components/EventsForm';
import EventsTable from './components/EventsTable';
import AudtsEventsReqTable from './components/AudtEventsReqTable';
import Divider from './components/Divider';
import toast, { Toaster } from 'react-hot-toast';

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

    const audtEventsReqQuery = useQuery({
        queryKey: ['audtEventsReq'],
        queryFn: getAudtEventsReq,
        refetchOnWindowFocus: false,
    });

    console.log(JSON.parse(JSON.stringify(eventsReqQuery)));

    if (
        eventsReqQuery.isPending ||
        customersQuery.isPending ||
        facilitiesQuery.isPending ||
        audtEventsReqQuery.isPending
    ) {
        toast.dismiss();
        toast.loading('Cargando datos...');
        return <Toaster />;
    } else if (
        eventsReqQuery.isError ||
        customersQuery.isError ||
        facilitiesQuery.isError ||
        audtEventsReqQuery.isError
    ) {
        toast.dismiss();
        toast.error(
            'Los datos no estan disponibles debido a problemas en el servidor.'
        );
        return <Toaster />;
    } else {
        const eventsReq = eventsReqQuery.data;
        const customers = customersQuery.data;
        const facilities = facilitiesQuery.data;
        const audtsEventsReq = audtEventsReqQuery.data;
        console.log(eventsReq);
        toast.dismiss();
        toast.success('Información cargada correctamente.');

        return (
            <>
                <Toaster />
                <EventsForm customers={customers} facilities={facilities} />
                <Divider title="Tabla EVENTREQUEST" />
                <EventsTable eventsReq={eventsReq} />
                <Divider title="Trigger de operaciones de EVENTREQUESTS" />
                <AudtsEventsReqTable audtsEventsReq={audtsEventsReq} />
            </>
        );
    }
}

export default App;
