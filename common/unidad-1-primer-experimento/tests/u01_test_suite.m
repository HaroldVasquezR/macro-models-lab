function report = u01_test_suite(unit_dir, include_graphics)
% U01_TEST_SUITE Pruebas de invariantes, dominios y archivos de referencia.
    cases = {
        'tasa cero', @test_zero;
        'calculo manual 100 -> 110 -> 121', @test_manual;
        'horizonte cero', @test_horizon_zero;
        'dimensiones e inicio', @test_shape;
        'recurrencia y formula', @test_recursion;
        'tasa negativa admisible', @test_negative;
        'proporcionalidad respecto de y0', @test_scale;
        'brecha y tasas no son equivalentes', @test_gap;
        'referencia independiente CSV', @() test_reference(unit_dir);
        'rechazar nivel cero', @() expect_error(@() growth_path(0,.02,5),'U01:InitialLevel');
        'rechazar nivel no finito', @() expect_error(@() growth_path(NaN,.02,5),'U01:InitialLevel');
        'rechazar tasa de -100 por ciento', @() expect_error(@() growth_path(100,-1,5),'U01:GrowthRate');
        'rechazar tasa vectorial', @() expect_error(@() growth_path(100,[.01 .02],5),'U01:GrowthRate');
        'rechazar horizonte fraccionario', @() expect_error(@() growth_path(100,.02,1.5),'U01:Horizon');
        'rechazar horizonte negativo', @() expect_error(@() growth_path(100,.02,-1),'U01:Horizon');
        'rechazar desbordamiento', @() expect_error(@() growth_path(realmax,1,1),'U01:NumericRange');
        'rechazar parametros incompletos', @() expect_error(@() u01_compute(struct('y0',100)),'U01:Parameters');
        'CSV: encabezado y precision', @test_csv;
        'runner sin graficos y metadatos', @test_runner;
        'horizonte corto sin filas duplicadas', @test_short_runner
    };
    if include_graphics
        cases(end+1,:) = {'exportacion PNG y PDF', @test_graphics};
    end
    report.names = cases(:,1);
    report.passed = false(size(cases,1),1);
    report.messages = cell(size(cases,1),1);
    report.engine_version = version;
    report.platform = computer;
    for j = 1:size(cases,1)
        try
            action = cases{j,2}; action();
            report.passed(j) = true;
            report.messages{j} = 'OK';
            fprintf('PASS | %s\n',cases{j,1});
        catch err
            report.messages{j} = err.message;
            fprintf('FAIL | %s | %s\n',cases{j,1},err.message);
        end
    end
    report.total = numel(report.passed);
    report.successes = sum(report.passed);
    fprintf('%d / %d pruebas superadas.\n',report.successes,report.total);
    if report.successes ~= report.total
        error('U01:TestsFailed','Hay pruebas fallidas. Revise los mensajes FAIL.');
    end
end
function p = fixed_params()
    p = struct('y0',100,'g_base',.02,'g_alt',.03,'T',20);
end
function test_zero()
    [~,y]=growth_path(100,0,20); assert(all(y==100));
end
function test_manual()
    [~,y]=growth_path(100,.10,2); close_enough(y,[100;110;121],1e-12);
end
function test_horizon_zero()
    [t,y]=growth_path(80,.03,0); assert(t==0 && y==80);
end
function test_shape()
    [t,y]=growth_path(100,.02,20);
    assert(isequal(size(t),[21 1]) && isequal(size(y),[21 1]));
    assert(t(1)==0 && t(end)==20 && y(1)==100);
end
function test_recursion()
    [~,y]=growth_path(100,.02,200); z=zeros(201,1); z(1)=100;
    for j=2:201, z(j)=1.02*z(j-1); end
    close_enough(y,z,1e-12);
end
function test_negative()
    [~,y]=growth_path(100,-.01,20); assert(all(diff(y)<0));
    close_enough(y(end),81.7906937597231,1e-12);
end
function test_scale()
    [~,a]=growth_path(100,.02,20); [~,b]=growth_path(200,.02,20);
    close_enough(b,2*a,1e-12);
end
function test_gap()
    r=u01_compute(fixed_params());
    close_enough(r.rate_gap_pp,1,1e-12);
    close_enough(r.gap_pct(end),100*((1.03/1.02)^20-1),1e-12);
    assert(abs(r.gap_pct(end)-r.gap_points(end))>1);
end
function test_reference(unit_dir)
    ref=dlmread(fullfile(unit_dir,'expected','growth_reference.csv'),',',1,0);
    r=u01_compute(fixed_params()); close_enough(r.matrix,ref,1e-11);
end
function test_csv()
    name=[tempname '.csv']; cleaner=onCleanup(@() remove_file(name)); %#ok<NASGU>
    r=u01_compute(fixed_params()); u01_write_csv(name,r.matrix);
    fid=fopen(name,'r'); assert(fid>=0); header=fgetl(fid); fclose(fid);
    assert(strcmp(header,['year,index_a,index_b,gap_points,gap_pct,' ...
                          'cumulative_a_pct,cumulative_b_pct']));
    close_enough(dlmread(name,',',1,0),r.matrix,1e-12);
end
function test_runner()
    d=tempname; mkdir(d); cleaner=onCleanup(@() rmdir(d,'s')); %#ok<NASGU>
    r=run_example(false,fixed_params(),d);
    assert(exist(fullfile(d,'run_metadata.txt'),'file')==2);
    assert(exist(fullfile(d,'growth_paths.csv'),'file')==2);
    assert(exist(fullfile(d,'growth_paths.png'),'file')~=2);
    txt=fileread(fullfile(d,'run_metadata.txt'));
    assert(~isempty(strfind(txt,'data_type=synthetic'))); %#ok<STREMP>
    close_enough(dlmread(fullfile(d,'growth_paths.csv'),',',1,0),r.matrix,1e-12);
end
function test_short_runner()
    d=tempname; mkdir(d); cleaner=onCleanup(@() rmdir(d,'s')); %#ok<NASGU>
    p=fixed_params(); p.T=0; run_example(false,p,d);
    x=dlmread(fullfile(d,'summary.csv'),',',1,0); assert(isequal(size(x),[1 7]));
end
function test_graphics()
    d=tempname; mkdir(d); cleaner=onCleanup(@() rmdir(d,'s')); %#ok<NASGU>
    run_example(true,fixed_params(),d);
    names={'growth_paths.png','growth_paths.pdf','relative_gap.png','relative_gap.pdf'};
    for j=1:numel(names)
        f=dir(fullfile(d,names{j})); assert(~isempty(f) && f.bytes>0);
    end
end
function close_enough(a,b,tol)
    assert(isequal(size(a),size(b)), 'Dimensiones distintas.');
    assert(all(isfinite(a(:))) && all(isfinite(b(:))), 'Valores no finitos.');
    scale=max(1,max(abs(b(:))));
    assert(max(abs(a(:)-b(:))) <= tol*scale, 'Diferencia mayor que la tolerancia.');
end
function expect_error(fun,id)
    got=false;
    try
        fun();
    catch err
        got=strcmp(err.identifier,id);
        if ~got, rethrow(err); end
    end
    assert(got, ['No se obtuvo el error esperado: ' id]);
end
function remove_file(name)
    if exist(name,'file')==2, delete(name); end
end
