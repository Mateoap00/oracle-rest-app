export const formatDate = (inputDate: Date | null) => {
    if (!(inputDate instanceof Date)) {
        return 'Invalid Date';
    }

    const monthsAbbrev = [
        'JAN',
        'FEB',
        'MAR',
        'APR',
        'MAY',
        'JUN',
        'JUL',
        'AUG',
        'SEP',
        'OCT',
        'NOV',
        'DEC',
    ];

    const day = inputDate.getDate().toString().padStart(2, '0');
    const monthAbbrev = monthsAbbrev[inputDate.getMonth()];
    const year = inputDate.getFullYear().toString().slice(-2);

    return `${day}-${monthAbbrev}-${year}`;
};
