import ReactPaginateModule from "react-paginate";
import { ChevronLeft, ChevronRight } from "lucide-react";
import "./Pagination.css";

const ReactPaginate = ReactPaginateModule.default;

export default function Pagination({ page, totalPages, onPageChange }) {
	const handlePageChange = (event) => {
		onPageChange(event.selected + 1);
		window.scrollTo({ top: 0, behavior: "smooth" });
	};

	return (
		<ReactPaginate
			pageCount={totalPages}
			forcePage={page - 1}
			onPageChange={handlePageChange}
			previousLabel={<ChevronLeft size={18} />}
			nextLabel={<ChevronRight size={18} />}
			breakLabel="..."
			pageRangeDisplayed={3}
			marginPagesDisplayed={1}
			containerClassName="pagination"
			pageClassName="page-circle"
			previousClassName="page-circle"
			nextClassName="page-circle"
			breakClassName="page-break"
			activeClassName="active"
			disabledClassName="disabled"
		/>
	);
}