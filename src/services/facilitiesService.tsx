import axios, { AxiosResponse } from 'axios';

const baseUrl = 'http://localhost:8080/ords/base2/rest-v1/facilities/';

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

export const getFacilities = async () => {
    const response: AxiosResponse<FacilitiesRequest> = await axios.get(baseUrl);
    const data: Facilities[] = response.data.items;
    return data;
};
