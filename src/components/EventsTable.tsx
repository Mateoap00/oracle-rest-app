/* eslint-disable @typescript-eslint/consistent-type-definitions */
import { EventRequest } from '../services/eventsService';

type EventsTableProps = {
    eventsReq: EventRequest[];
};

const EventsTable = ({ eventsReq }: EventsTableProps) => {
    return (
        <>
            <div className="overflow-x-auto">
                <table className="min-w-full divide-y-2 divide-gray-900 bg-white text-md">
                    <thead className="ltr:text-left rtl:text-right">
                        <tr>
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
                                dateAuth
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                dateHeld
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                dateReq
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
                        {eventsReq.map((eventReq) => {
                            return (
                                <tr key={eventReq.eventno}>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-black">
                                        {eventReq.eventno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {eventReq.budno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {eventReq.custno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {eventReq.facno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {eventReq.dateauth}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {eventReq.dateheld}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {eventReq.datereq}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {eventReq.estaudience}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {eventReq.estcost}
                                    </td>
                                    {eventReq.status === 'Approved' ? (
                                        <td className="whitespace-nowrap px-4 py-2 text-green-600 dark:text-gray-200">
                                            {eventReq.status}
                                        </td>
                                    ) : null}
                                    {eventReq.status === 'Pending' ? (
                                        <td className="whitespace-nowrap px-4 py-2 text-yellow-600 dark:text-gray-200">
                                            {eventReq.status}
                                        </td>
                                    ) : null}
                                    {eventReq.status === 'Denied' ? (
                                        <td className="whitespace-nowrap px-4 py-2 text-red-600 dark:text-gray-200">
                                            {eventReq.status}
                                        </td>
                                    ) : null}

                                    <td className="whitespace-nowrap px-4 py-2">
                                        <a
                                            href="#"
                                            className="inline-block rounded bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700"
                                        >
                                            Edit
                                        </a>
                                    </td>
                                </tr>
                            );
                        })}
                    </tbody>
                </table>
            </div>
        </>
    );
};

export default EventsTable;
