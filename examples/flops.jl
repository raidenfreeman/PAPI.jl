import PAPI

function slow_code()
    tmp = 1.1
    for i=1:2_000_000
        tmp = (tmp+100)/i
    end
    return tmp
end

function main()
    precompile(slow_code, ())

    real_time, proc_time, flpops, mflops = @PAPI.flops slow_code()

    @printf("Real_time: %f Proc_time: %f Total flpops: %lld MFLOPS: %f\n",
             real_time, proc_time, flpops, mflops)
end

main()
