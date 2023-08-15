<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- SMALL MODAL -->
<div id="modaldemo9" class="modal fade">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content bd-0 tx-14">
            <div class="modal-header pd-x-20">
                <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Notice</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pd-20">
                <p class="mg-b-5">Bạn có muốn đăng xuất không?</p>
            </div>
            <div class="modal-footer justify-content-center">
                <a href="${pageContext.request.contextPath}/logout" type="button"
                   class="btn btn-primary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium save-changes-btn">Log
                    out</a>
                <button type="button" class="btn btn-secondary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium"
                        data-dismiss="modal">Cancel
                </button>
            </div>
        </div>
    </div><!-- modal-dialog -->
</div>
<!-- modal -->
<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>

<script>
    $(function () {

        // showing modal with effect
        $('.modal-effect2').on('click', function (e) {
            e.preventDefault();
            var effect = $(this).attr('data-effect');
            $('#modaldemo9').addClass(effect);
            $('#modaldemo9').modal('show');
        });

        // hide modal with effect
        $('#modaldemo9').on('hidden.bs.modal', function (e) {
            $(this).removeClass(function (index, className) {
                return (className.match(/(^|\s)effect-\S+/g) || []).join(' ');
            });
        });
    });
</script>

