$(document).ready(function () {
	$("#kode_produk").on("input", function () {
		var kode_produk = $(this).val();

		// Lakukan validasi hanya jika kode_produk memiliki panjang lebih dari 0
		if (nim.length > 0) {
			$.ajax({
				type: "POST",
				url: "validate_kode.php", // Buat file PHP yang akan memproses validasi
				data: { kode_produk: kode_produk },
				success: function (response) {
					if (response === "exists") {
						$("#kode_produk").addClass("is-invalid");
						$("#kode_produk-error").text("Kode sudah ada dalam database.");
						$('#tambah_barang button[type="submit"]').prop(
							"disabled",
							true
						);
					} else {
						$("#kode_produk").removeClass("is-invalid");
						$("#kode_produk-error").text("");
						$('#tambah-_barang button[type="submit"]').prop(
							"disabled",
							false
						);
					}
				},
			});
		}
	});
});