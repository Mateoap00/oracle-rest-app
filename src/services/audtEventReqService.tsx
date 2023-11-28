import axios, { AxiosResponse } from 'axios';

const baseUrl = 'http://localhost:8080/ords/base2/rest-v1/audt-eventrequests/';

export type AudtEventsReq = {
    id: number;
    tipo_operacion: string;
    fecha_operacion: string;
    usuario: string;
    old_eventno: string | null;
    new_eventno: string | null;
    old_custno: string | null;
    new_custno: string | null;
    old_facno: string | null;
    new_facno: string | null;
    old_budno: string | null;
    new_budno: string | null;
    old_dateheld: string | null;
    new_dateheld: string | null;
    old_datereq: string | null;
    new_datereq: string | null;
    old_dateauth: string | null;
    new_dateauth: string | null;
    old_estaudience: number | null;
    new_estaudience: number | null;
    old_estcost: number | null;
    new_estcost: number | null;
    old_status: string | null;
    new_status: string | null;
};

type Links = {
    rel: string;
    href: string;
};

type AudtEventsReqRequest = {
    items: AudtEventsReq[];
    hasMore: boolean;
    limit: number;
    offset: number;
    count: number;
    links: Links[];
};

export const getAudtEventsReq = async () => {
    const response: AxiosResponse<AudtEventsReqRequest> =
        await axios.get(baseUrl);
    const data: AudtEventsReq[] = response.data.items;
    return data;
};
