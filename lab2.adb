with Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random,Ada.Calendar;
use Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random,Ada.Calendar;

procedure lab2 is
  type Wektor is array (Integer range <>) of Float;
  W1: Wektor (1 .. 10) := (others => 3.0);
  T1,T2: Time;
  D: Duration;

  procedure display (W1: in Wektor) is
  begin
    for W of W1 loop
      Put_Line(W'Img);
    end loop;
  end display;

  procedure randomize(W1: in out Wektor) is
  G: Generator;
  begin
    Reset(G);
    for I in W1'Range loop
      W1(I) := Random(G);
    end loop;
  end randomize;

  procedure sort(W1: in out Wektor) is
    Tmp : Float;
  begin
    for J in W1'First .. W1'Last-1 loop
      for I in W1'First .. W1'Last-1 loop
        if W1(I) > W1(I+1) then
          Tmp := W1(I);
          W1(I) := W1(I+1);
          W1(I+1) := Tmp;
        end if;
      end loop;
    end loop;
  end sort;

  function isRosnace(W1: in Wektor) return Boolean is
    (for all I in W1'First..(W1'Last-1) => W1(I)<=W1(I+1));

  begin
    T1 := Clock;
    randomize(W1);
    sort(W1);
    display(W1);
    Put_Line("isRosnace = " &isRosnace(W1)'Img);
    T2 := Clock;
    D := T2 - T1;
    Put_Line("czas obliczen = " &D'Img);
  end lab2;
