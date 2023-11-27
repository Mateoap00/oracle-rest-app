import { EventRequest } from '../services/eventsService';
import { useAppContext } from '../AppContext';
import { EventsRow } from './EventsRow';

type EventsTableProps = {
    eventsReq: EventRequest[];
};

const EventsTable: React.FC<EventsTableProps> = ({ eventsReq }) => {
    // const { dispatch } = useAppContext();
    const editMode = useAppContext().state.editing.isEditing;
    const eventReq = useAppContext().state.editing.eventReq;
    return (
        <>
            <div className="overflow-x-auto">
                <table className="min-w-full divide-y-2 divide-gray-900 bg-white text-md">
                    <thead className="ltr:text-left rtl:text-right">
                        <tr>
                            <th className="whitespace-nowrap px-2 py-2 font-large text-black dark:text-white"></th>
                            <th className="whitespace-nowrap px-2 py-2 font-large text-black dark:text-white">
                                eventNo
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                budNo
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                custNo
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                facNo
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                dateReq
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                dateHeld
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                dateAuth
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                estAudience
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                estCost
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                status
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
