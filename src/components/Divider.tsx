type DividerProps = {
    title: string;
};

const Divider: React.FC<DividerProps> = ({ title }) => {
    return (
        <span className="flex items-center py-5">
            <span className="h-px flex-1 bg-black"></span>
            <span className="shrink-0 bg-white px-6 text-xl font-bold text-indigo-600">
                {title}
            </span>
            <span className="h-px flex-1 bg-black"></span>
        </span>
    );
};

export default Divider;
