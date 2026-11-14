function report = run_tests(include_graphics)
% RUN_TESTS Ejecuta pruebas propias sin frameworks ni paquetes extra.
%   report = run_tests;       % pruebas numericas y de exportacion CSV
%   report = run_tests(true); % agrega exportacion grafica PNG/PDF
% La bateria usa parametros de referencia fijos, independientes de params.m.
% Los mensajes PASS/FAIL son resultados de la ejecucion local, no promesas.
    if nargin < 1, include_graphics = false; end
    if ~(islogical(include_graphics) && isscalar(include_graphics))
        error('U01:Flag','Use true o false.');
    end
    unit_dir = fileparts(mfilename('fullpath'));
    old_path = path;
    clean_path = onCleanup(@() path(old_path)); %#ok<NASGU>
    addpath(unit_dir,fullfile(unit_dir,'src'),fullfile(unit_dir,'tests'));
    report = u01_test_suite(unit_dir,include_graphics);
end
