import { AudtEventsReq } from '../services/audtEventReqService';

type AudtEventsReqTableProps = {
    audtsEventsReq: AudtEventsReq[];
};

const AudtsEventsReqTable: React.FC<AudtEventsReqTableProps> = ({
    audtsEventsReq,
}) => {
    return (
        <>
            <div className="overflow-x-auto">
                <table className="min-w-full divide-y-2 divide-gray-900 bg-white text-md">
                    <thead className="ltr:text-left rtl:text-right">
                        <tr>
                            <th className="whitespace-nowrap px-2 py-2 font-large text-black dark:text-white">
                                ID
                            </th>
                            <th className="whitespace-nowrap px-2 py-2 font-large bg-gray-200 text-black dark:text-white">
                                Tipo Operación
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                Fecha Operación
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                Usuario
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                OLD_EVENTNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                NEW_EVENTNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                OLD_CUSTNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                NEW_CUSTNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                OLD_FACNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                NEW_FACNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                OLD_BUDNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                NEW_BUDNO
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                OLD_DATEHELD
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                NEW_DATEHELD
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                OLD_DATEREQ
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                NEW_DATEREQ
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                OLD_DATEAUTH
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                NEW_DATEAUTH
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                OLD_ESTAUDIENCE
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                NEW_ESTAUDIENCE
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                OLD_ESTCOST
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                NEW_ESTCOST
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large text-black dark:text-white">
                                OLD_STATUS
                            </th>
                            <th className="whitespace-nowrap px-4 py-2 font-large bg-gray-200 text-black dark:text-white">
                                NEW_STATUS
                            </th>
                        </tr>
                    </thead>

                    <tbody className="divide-y divide-gray-200 dark:divide-gray-700">
                        {audtsEventsReq.map((audtEventReq) => {
                            return (
                                <tr key={audtEventReq.id}>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-black">
                                        {audtEventReq.id}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.tipo_operacion}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.fecha_operacion}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.usuario}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.old_eventno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.new_eventno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.old_custno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.new_custno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.old_facno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.new_facno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.old_budno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.new_budno}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.old_dateheld}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.new_dateheld}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.old_datereq}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.new_datereq}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.old_dateauth}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.new_dateauth}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.old_estaudience}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.new_estaudience}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.new_estcost}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.old_estcost}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.old_status}
                                    </td>
                                    <td className="whitespace-nowrap px-4 py-2 bg-gray-200 text-gray-900 dark:text-gray-200">
                                        {audtEventReq.new_status}
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

export default AudtsEventsReqTable;
