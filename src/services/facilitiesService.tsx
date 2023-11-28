import axios, { AxiosResponse } from 'axios';

const baseUrl = 'http://localhost:8080/ords/base4/rest-v1/facilities/';

export type Facilities = {
    facno: string;
    facname: string;
};

type Links = {
    rel: string;
    href: string;
};

type FacilitiesRequest = {
    items: Facilities[];
    hasMore: boolean;
    limit: number;
    offset: number;
    count: number;
    links: Links[];
};

export type EventOfFacility = {
    facno: string;
    facname: string;
    eventno: string;
    dateheld: string;
    datereq: string;
    dateauth: string | null;
    status: string;
};

type AllEventsOfFacility = {
    items: EventOfFacility[];
    hasMore: boolean;
    limit: number;
    offset: number;
    count: number;
    links: Links[];
};

export const getFacilities = async () => {
    const response: AxiosResponse<FacilitiesRequest> = await axios.get(baseUrl);
    const data: Facilities[] = response.data.items;
    return data;
};

export const getAllEventsOfFacility = async (facno: string) => {
    try {
        const response: AxiosResponse<AllEventsOfFacility> = await axios.get(
            `${baseUrl}${facno}`
        );
        const data: EventOfFacility[] = response.data.items;
        return data;
    } catch (err) {
        console.log(err);
    }
};
