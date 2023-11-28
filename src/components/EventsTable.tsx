import { EventRequest } from '../services/eventsService';
import { useAppContext } from '../AppContext';
import { EventsRow } from './EventsRow';

type EventsTableProps = {
    eventsReq: EventRequest[] | undefined;
};

const EventsTable: React.FC<EventsTableProps> = ({ eventsReq }) => {
    const editMode = useAppContext().state.editing.isEditing;
    const eventReq = useAppContext().state.editing.eventReq;

    return (
        <>
            <div className="overflow-x-auto">
                <table className="min-w-full divide-y-2 divide-gray-900 bg-white text-md">
                    <thead className="ltr:text-left rtl:text-right">
                        <tr>
                            <th className="whitespace-nowrap px-2 py-2 font-large text-black dark:text-white"></th>
                            <th className="whitespace-nowrap px-2 py-2 font-large bg-gray-200 text-black dark:text-white">
                                EVENTNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                CUSTNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                FACNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                BUDNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                DATEREQ
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                DATEHELD
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                DATEAUTH
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                ESTAUDIENCE
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                ESTCOST
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                STATUS
                            </th>
                        </tr>
                    </thead>

                    <tbody className="divide-y divide-gray-200 dark:divide-gray-700">
                        {editMode && eventReq ? (
                            <EventsRow
                                key={eventReq.eventno}
                                eventReq={eventReq}
                            />
                        ) : (
                            eventsReq.map((eventReq) => {
                                return (
                                    <EventsRow
                                        key={eventReq.eventno}
                                        eventReq={eventReq}
                                    />
                                );
                            })
                        )}
                    </tbody>
                </table>
            </div>
        </>
    );
};

export default EventsTable;
