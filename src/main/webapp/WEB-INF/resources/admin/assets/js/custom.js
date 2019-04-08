$(document).ready(function() {
	// KHI CLICK VÀO NUT CHECKALL THÌ TẤT CẢ CÁC ROW ĐƯỢC CHECK
	var $checkAll = $('#checkAll');
	$checkAll.click(function() {
		var checkAll = this.checked;
		$("input[name='checkItem']").each(function() {
			this.checked = checkAll;
		});
	});

	// KHI TẤT CẢ CÁC ROW ĐƯỢC CHECK HOẶC TỒN TẠI MỘT ROW KO ĐƯỢC CHECK THÌ PHẢI
	// CẬP NHẬT NÚT CHECKALL
	$("input[name='checkItem']").click(function() {
		$checkAll[0].checked = isCheckedAll();
	});
	function isCheckedAll() {
		var check = true;
		$("input[name='checkItem']").each(function() {
			if (this.checked == false) {
				check = false;
				return;
			}
		});
		return check;
	}
});