<!-- Sidebar -->
<div class="d-block">
    <nav id="sidebar" class="z">
        <div class="sidebar-header" id="sidebarCollapse">
            <h3>LGR Instruktor</h3>
            <strong>LGR</strong>
        </div>


        <ul class="list-unstyled components">
            <li class="active">
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="fas fa-anchor"></i>
                    Kursy
                </a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li>
                        <a href="/course/add" class="white">Dodaj kurs</a>
                    </li>
                    <li>
                        <a href="/course/all" class="white">Zobacz kursy</a>
                    </li>

                </ul>
            </li>

            <li>
                <a href="#" class="white">
                    <i class="fas fa-users"></i>
                    Uzytkownicy
                </a>
            </li>

        </ul>

        <ul class="list-unstyled CTAs">
            <li>
                <a href="/course/add" class="download"><i class="fa fa-plus-circle"></i> DODAJ KURS</a>

            </li>
        </ul>

    </nav>
</div>
<!-- jQuery CDN - Slim version (=without AJAX) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
        crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
        integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
        crossorigin="anonymous"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>