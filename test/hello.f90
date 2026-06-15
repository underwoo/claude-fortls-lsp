module greeting
  implicit none

contains

  subroutine say_hello(name)
    character(len=*), intent(in) :: name
    write(*,*) "Hello, ", trim(name)
  end subroutine say_hello

  function add(a, b) result(total)
    integer, intent(in) :: a, b
    integer :: total
    total = a + b
  end function add

end module greeting
